set HALE_TRANSFORMATION_INTERNAL_VALIDATION=true

hale.bat transform ^
  -project hc:project:org:163:6478099f-62f7-47ac-a78e-e4000a632d30 ^
  -source source\NBA-Mustermonzel_20100520T144438_1von8_32345000_5525000.gml.gz ^
  -source source\NBA-Mustermonzel_20100520T144438_2von8_32350000_5525000.gml.gz ^
  -source source\NBA-Mustermonzel_20100520T144438_3von8_32345000_5530000.gml.gz ^
  -source source\NBA-Mustermonzel_20100520T144438_4von8_32350000_5530000.gml.gz ^
  -source source\NBA-Mustermonzel_20100520T144438_5von8_32355000_5530000.gml.gz ^
  -source source\NBA-Mustermonzel_20100520T144438_8von8_32345000_5525000.gml.gz ^
  -target target\lc-result-basic.gml ^
    -providerId eu.esdihumboldt.hale.io.wfs.fc.write-2.0 ^
    -Sxml.pretty true ^
    -Scrs.epsg.prefix http://www.opengis.net/def/crs/EPSG/0/ ^
  -validate eu.esdihumboldt.hale.io.xml.validator ^
  -stacktrace ^
  -trustGroovy ^
  -statisticsOut target\lc-result-basic-stats.json
