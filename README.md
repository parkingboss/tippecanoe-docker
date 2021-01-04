# Mapbox's TippeCanoe on Docker

There are several of these. This is just under our control and fixed to Ubuntu 20.04 and Mapbox 1.8.1.

If other versions are needed we will tag appropriately.

## Tags

The image's version tags will be pinned to tippecanoe. Any time an update is made to Tippecanoe we can rebuild.

## Development

Rebuilding is straightforward: update the git tag being pulled in the Dockerfile, re-run the build. This could be improved by
splitting the build into environment and actual build. (vNext). After building tag on git and push. You'll need to manually update the less specific version tags like latest, and the minor only tag.
