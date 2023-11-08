# Quickstart

## Prerequisites

- Docker (with Compose)

## 1. Launch OpenMeter

Launch OpenMeter and its dependencies via:

```sh
docker-compose up -d
```

## 2. Configure additional meter(s) _(optional)_

Configure how OpenMeter should process your usage events.
In this example we will meter the execution duration per API invocation, groupped by method and path.

```yaml
# ...

meters:
  - slug: m1
    description: API calls
    type: api-calls
    valueProperty: $.duration_ms
    aggregation: SUM
    groupBy:
      method: $.method
      path: $.path
```

## Cleanup

Once you are done, stop any running instances:

```sh
docker-compose down -v
```
