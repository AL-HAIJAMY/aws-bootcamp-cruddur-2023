# Week 2 — Distributed Tracing

## watched all the videos 

## i have created a new environment in Honeycomb named my AWS bootcamp

## i have set my env var ( API KEY ONLY ) along with jessica advise not to set the service name here while later in the docker compose file .

## i named the OTEL service name in the docker compose file  .. -- added the other OTEL elemnts to the file too . 

## added instrument packages to the requirements file 

## cretaed the trace files in app.py and initialized the tracing and initialized the automatic instrumentation to honeycomb in app.py 

## did a compose up and everything is ok so far and added some fixed ports to yml file to avoid every time opening the ports manually 

## added additional step to wiew logs in the backend flask app by creating additional initialized tracer and exporter for console logs 

## i got some results and traces in Honeycomb ( see examples below )

![Honeycomb Home ]()

![Honeycomb recent traces ]()

![Honycomb trace example " Trace 770dc482521f993d809a052c1ebb6481 "]()

## i went through the trace and checked the attributes mentioned there . i can see the service name , the time stamp , the duration .

## to have some spans we need to accuire a trace then create some spans to visualize them in honeycomb 

## after creating the spans i got some more spans in the same trace as shown .

![Home-activities-mock-data span example ]()

## added some attributes to the spans . ( our custom attributes ) 

## we got the new custom attribute mentioned in the span details (result length)

![app.result_length attribute example ]()

## 



