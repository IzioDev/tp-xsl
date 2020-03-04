<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:demo="http://exemple.com/ns/countries"
	version="1.0"
>

<xsl:template match="demo:countries">
  <html>
    <head>
      <meta charset="utf-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <title>Liste des pays</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css"/>
      <script src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bulma-extensions@6.2.7/dist/js/bulma-extensions.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bulma-extensions@6.2.7/bulma-accordion/dist/js/bulma-accordion.min.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-extensions@6.2.7/bulma-accordion/dist/css/bulma-accordion.min.css"/>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-extensions@6.2.7/dist/css/bulma-extensions.min.css"/>
    </head>
    <body>
      <div class="container">
        <h1 class="title">Partie 1</h1>
        <section class="accordions">
          <article class="accordion">
            <div class="accordion-header toggle">
              <p>Liste des pays par ordre croissant des noms</p>
            </div>
            <div class="accordion-body">
              <div class="accordion-content">
                <xsl:for-each select="/demo:countries/demo:country">
                  <xsl:sort select="@name" order="ascending"></xsl:sort>
                  <p><xsl:value-of select="@name"/></p>
                </xsl:for-each>
              </div>
            </div>
          </article>
          <article class="accordion">
            <div class="accordion-header toggle">
              <p>Liste des pays par ordre croissant des populations</p>
            </div>
            <div class="accordion-body">
              <div class="accordion-content">
                <xsl:for-each select="/demo:countries/demo:country">
                  <xsl:sort select="@population" order="ascending"></xsl:sort>
                  <p><xsl:value-of select="@name"/></p>
                </xsl:for-each>
              </div>
            </div>
          </article>
          <article class="accordion">
            <div class="accordion-header toggle">
              <p>Liste des pays par ordre croissant des superficies</p>
            </div>
            <div class="accordion-body">
              <div class="accordion-content">
                <xsl:for-each select="/demo:countries/demo:country">
                  <xsl:sort select="@area" order="ascending"></xsl:sort>
                  <p><xsl:value-of select="@name"/></p>
                </xsl:for-each>
              </div>
            </div>
          </article>
        </section>
      </div>

		  <!-- <h3 class="title">list pays hispanisant</h3>
      <xsl:apply-templates select="/demo:countries/demo:country[demo:language = 'Spanish']/@name"/>

      <hr/>

		  <h3 class="title">list pays hispanisant > 30 000 000 ha</h3>
      <xsl:apply-templates select="/demo:countries/demo:country[demo:language = 'Spanish'][@population > 30000000]/@name"/>

      <hr/>

      <h3 class="title">list villes</h3>
      <xsl:apply-templates select="demo:country[demo:language = 'Spanish']/descendant::demo:name"/>

      <hr/>

      <h3 class="title">Liste des pays ayant des villes de plus de 8 million d'hab</h3>
      <xsl:apply-templates select="demo:country/demo:city[demo:population > 8000000]/ancestor::demo:country/@name"/>
      <xsl:apply-templates select="demo:country[demo:city/demo:population > 8000000]/@name"/> -->
      <script>
        <!-- Charge les accordions lorsque le DOM est prêt -->
        document.addEventListener('DOMContentLoaded', (event) => {
          var accordions = bulmaAccordion.attach();
        });
      </script>
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
