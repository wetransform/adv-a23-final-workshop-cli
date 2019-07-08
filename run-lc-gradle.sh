#!/bin/bash

set -v

hale transform \
  -project hc:project:org:163:6478099f-62f7-47ac-a78e-e4000a632d30 \
  -source source/ \
    -include *.gz \
    -providerId eu.esdihumboldt.hale.io.gml.reader \
    -ScontentType eu.esdihumboldt.hale.io.xml.gzip \
  -source source/ \
    -include *.gml \
    -include *.xml \
    -providerId eu.esdihumboldt.hale.io.gml.reader \
    -ScontentType org.eclipse.core.runtime.xml \
  -filter "CQL:modellart.AA_Modellart.advStandardModell = 'DLKM'" \
  -exclude $'groovy: \n\
    def id = instance.p.id.value(); \n\
    boolean rejected = false; \n\
    if (id) { \n\
      withContext { \n\
        def collect = _.context.collector(it); \n\
        if (collect.ids.values().contains(id)) { \n\
          _log.warn(\'Rejecting feature with duplicate id \' + id); \n\
          rejected = true; \n\
        } \n\
        else { \n\
          collect.ids << id; \n\
        } \n\
      } \n\
    } \n\
    \n\
    rejected;\n' \
  -target target/lc-result-gradle.gml \
    -providerId eu.esdihumboldt.hale.io.wfs.fc.write-2.0 \
    -Sxml.pretty true \
    -Scrs.epsg.prefix http://www.opengis.net/def/crs/EPSG/0/ \
    -SskipFeatureCount true \
  -validate eu.esdihumboldt.hale.io.xml.validator \
  -reportsOut target/lc-reports-gradle.log \
  -stacktrace \
  -trustGroovy \
  -overallFilterContext
