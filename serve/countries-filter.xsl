<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:demo="http://exemple.com/ns/countries"

	version="1.0"
>

<xsl:template match="node()|@*">
  <xsl:copy>
    <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="demo:country[not(demo:language = 'Spanish')]"/>

</xsl:stylesheet>
