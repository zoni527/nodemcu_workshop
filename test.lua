print("Hello, world!")

http.post(
	"https://api.digitransit.fi/routing/v2/hsl/gtfs/v1",
	"digitransit-subscription-key:REMOVED&\
	content-Type:application/graphql",
	'{\
		stop(id: "HSL:1113140") {\
			name\
			code\
			gtfsId\
			stoptimesWithoutPatterns {\
			realtime\
			realtimeState\
			scheduledArrival\
			realtimeArrival\
			arrivalDelay\
			scheduledDeparture\
			realtimeDeparture\
			departureDelay\
			headsign\
			trip {\
				id\
				gtfsId\
				route {\
					shortName\
				}\
			}\
		}\
	}',
	function(code, data)
		if code < 0 then
			print("HTTP request failed")
		else
			t = sjson.decode(data)
			for k, v in pairs(t) do
				print(k, v)
			end
		end
	end
)
