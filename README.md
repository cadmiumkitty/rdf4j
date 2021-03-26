# RDF4J Docker File

Inspired by Docker image from [Eclipse](https://github.com/eclipse/rdf4j/tree/main/assembly/src/main/dist/docker) and [ART Group](https://bitbucket.org/art-uniroma2/vocbench3-docker/src/master/). Removes the need for separately downloading the archive files. Unpacks and places `st-trivial-inference-sail` and `st-changetracking-sail` on to Tomcat classpath.

## Versioning

Key driver for this RDF4J image is to provide a separate VocBench backend based on RDF4J. Tags for the images intend to be `<version of rdf4j>-vocbench3-<version of vocbench>`.

## Workbench configuration

This image skips Workbench UTF-8 configuration suggested in [RDF4J Server and Workbench](https://rdf4j.org/documentation/tools/server-workbench/) because users are not intended to interact with Workbench.