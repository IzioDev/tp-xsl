<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:demo="http://exemple.com/ns/countries"
	version="1.0"
>

<xsl:template match="demo:countries">
  <html>
    <body>
		<h3>list pays hispanisant</h3>
      <xsl:apply-templates select="/demo:countries/demo:country[demo:language = 'Spanish']/@name"/>
<hr/>
		<h3>list pays hispanisant > 30 000 000 ha</h3>
      <xsl:apply-templates select="/demo:countries/demo:country[demo:language = 'Spanish'][@population > 30000000]/@name"/>
<hr/>
	    <h3>list villes</h3>
      <xsl:apply-templates select="demo:country[demo:language = 'Spanish']/descendant::demo:name"/>
<hr/>
	<h3>Liste des pays ayant des villes de plus de 8 million d'hab</h3>

      <xsl:apply-templates select="demo:country/demo:city[demo:population > 8000000]/ancestor::demo:country/@name"/>
	  <xsl:apply-templates select="demo:country[demo:city/demo:population > 8000000]/@name"/>
   </body>
  </html>
</xsl:template>

<xsl:template match="demo:name">
  <p><xsl:apply-templates/></p>
</xsl:template>

<xsl:template match="@name">
  <p><xsl:value-of select="."/></p>
</xsl:template>

<!--
 <xsl:template match="demo:city">
   <p>une ville !!</p>
 </xsl:template>


 <xsl:template match="demo:country">
   <p>un pays !!</p>
 </xsl:template>
-->
</xsl:stylesheet>
