#!/usr/bin/env bash
set -euo pipefail

kubectl get pods -A -o json > /tmp/pods.json
kubectl get --raw /apis/metrics.k8s.io/v1beta1/pods > /tmp/pod-metrics.json

jq -r -s '
  def mem_mi:
    if . == null or . == "" then 0
    elif test("Ki$") then (sub("Ki$";"") | tonumber) / 1024
    elif test("Mi$") then (sub("Mi$";"") | tonumber)
    elif test("Gi$") then (sub("Gi$";"") | tonumber) * 1024
    elif test("Ti$") then (sub("Ti$";"") | tonumber) * 1024 * 1024
    else 0
    end;

  .[0].items as $pods |
  .[1].items as $metrics |

  [
    $pods[] |
    .metadata.namespace as $ns |
    .metadata.name as $pod |

    (
      [.spec.containers[]?.resources.requests.memory // "0"]
      | map(mem_mi)
      | add
    ) as $request |

    (
      $metrics[]
      | select(.metadata.namespace == $ns and .metadata.name == $pod)
      | [.containers[]?.usage.memory // "0"]
      | map(mem_mi)
      | add
    ) // 0 as $usage |

    {
      request: $request,
      usage: $usage,
      difference: ($request - $usage),
      namespace: $ns,
      pod: $pod
    }
  ]
  | sort_by(-.request)
  | .[]
  | [
      (.request | floor | tostring),
      (.usage | floor | tostring),
      (.difference | floor | tostring),
      .namespace,
      .pod
    ]
  | @tsv
' /tmp/pods.json /tmp/pod-metrics.json |
  (
    printf 'REQUEST_Mi\tUSAGE_Mi\tREQUEST_MINUS_USAGE_Mi\tNAMESPACE\tPOD\n'
    cat
  ) | column -t -s $'\t'

