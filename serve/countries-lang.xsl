<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:demo="http://exemple.com/ns/countries"
	version="1.0"
>

<xsl:template match="demo:countries">
  <html>
	<head>
	<title>Pays</title>
	</head>
    <body>
			<xsl:apply-templates select="demo:country"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="demo:country">
  <div>
	<xsl:attribute name="class">
       <xsl:text>country</xsl:text>
	   <xsl:apply-templates select="demo:language"/>
    </xsl:attribute>
	<h2><xsl:value-of select="@name"/></h2>
  </div>
</xsl:template>

<xsl:template match="demo:language">
	<xsl:text> </xsl:text>
	<xsl:value-of select="."/>
	<xsl:text>-spoken</xsl:text>
</xsl:template>

</xsl:stylesheet>
