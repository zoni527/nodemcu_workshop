#!/bin/env bash
curl 'https://api.digitransit.fi/routing/v2/hsl/gtfs/v1' -X POST \
-H "digitransit-subscription-key: ${DIGITRANSIT_KEY}" \
-H 'Content-Type: application/graphql' \
--data \
'{
  stop(id: "HSL:1113140") {
    name
    code
    gtfsId
    stoptimesWithoutPatterns {
      realtime
      realtimeState
      scheduledArrival
      realtimeArrival
      arrivalDelay
      scheduledDeparture
      realtimeDeparture
      departureDelay
      headsign
      trip {
        id
        gtfsId
        route {
          shortName
        }
      }
    }
  }
}'
