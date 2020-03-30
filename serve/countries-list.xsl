<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:demo="http://exemple.com/ns/countries"
        version="1.0">

  <xsl:template match="demo:countries">
    <html>
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Liste des pays</title>
        <link rel="stylesheet" href="./main.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css"/>
        <script src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"/>
        <script src="https://cdn.jsdelivr.net/npm/bulma-extensions@6.2.7/dist/js/bulma-extensions.min.js"/>
        <script src="https://cdn.jsdelivr.net/npm/bulma-extensions@6.2.7/bulma-accordion/dist/js/bulma-accordion.min.js"/>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bulma-extensions@6.2.7/bulma-accordion/dist/css/bulma-accordion.min.css"/>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bulma-extensions@6.2.7/dist/css/bulma-extensions.min.css"/>
      </head>
      <body>

        <div class="columns">
          <div class="column is-one-quarter">

            <aside class="menu fixed-side-menu" style="position: fixed;">
              <p class="menu-label">
                Pays triés
              </p>

              <ul class="menu-list">
                <li>
                  <a href="#pays_sort_name">Ordre alphabétique</a>
                </li>
                <li>
                  <a href="#pays_sort_population">Population</a>
                </li>
                <li>
                  <a href="#pays_sort_area">Superficie</a>
                </li>
              </ul>

              <p class="menu-label">
                Détails par pays
              </p>
              <ul class="menu-list">
                <xsl:apply-templates mode="menu" select="demo:country"/>
              </ul>
            </aside>


          </div>
          <div class="column">
            <div class="container">
              <h1 class="title">Pays triés</h1>
              <section class="accordions">
                <article class="accordion">
                  <div class="accordion-header toggle">
                    <p id="pays_sort_name">Liste des pays par ordre croissant des noms</p>
                  </div>
                  <div class="accordion-body">
                    <div class="accordion-content">
                      <xsl:for-each select="/demo:countries/demo:country">
                        <xsl:sort select="@name" order="ascending"></xsl:sort>
                        <p>
                          <xsl:value-of select="@name"/>
                        </p>
                      </xsl:for-each>
                    </div>
                  </div>
                </article>
                <article class="accordion">
                  <div class="accordion-header toggle">
                    <p id="pays_sort_population">Liste des pays par ordre croissant des populations</p>
                  </div>
                  <div class="accordion-body">
                    <div class="accordion-content">
                      <xsl:for-each select="/demo:countries/demo:country">
                        <xsl:sort select="@population" order="ascending"></xsl:sort>
                        <p>
                          <xsl:value-of select="@name"/>
                        </p>
                      </xsl:for-each>
                    </div>
                  </div>
                </article>
                <article class="accordion">
                  <div class="accordion-header toggle">
                    <p id="pays_sort_area">Liste des pays par ordre croissant des superficies</p>
                  </div>
                  <div class="accordion-body">
                    <div class="accordion-content">
                      <xsl:for-each select="/demo:countries/demo:country">
                        <xsl:sort select="@area" order="ascending"/>
                        <p>
                          <xsl:value-of select="@name"/>
                        </p>
                      </xsl:for-each>
                    </div>
                  </div>
                </article>
              </section>

              <hr/>

              <h1 class="title">Les 10 premiers pays</h1>
              <xsl:apply-templates select="demo:country"/>
            </div>
          </div>
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

  <xsl:template match="demo:country">
    <h2 id="{generate-id(@name)}" class="subtitle">
      <xsl:value-of select="@name"/>
    </h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">
            superficie
          </th>
          <th scope="col">
            population
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <xsl:value-of select="@area"/>
          </td>
          <td>
            <xsl:value-of select="@population"/>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="content">
      <ol type="1">
        <xsl:apply-templates select="demo:city" mode="city-info"/>
      </ol>
    </div>


    <hr/>
  </xsl:template>

  <xsl:template match="demo:country/demo:city" mode="city-info">
    <li>
      <xsl:value-of select="demo:name"/>,
      <xsl:value-of select="demo:population"/> habitants,
      <xsl:value-of select="ceiling(demo:population div ../@population * 100)"/> % de la population totale.
    </li>
  </xsl:template>

  <xsl:template match="demo:country" mode="menu">
    <li>
      <a href="#{generate-id(@name)}">
        <xsl:value-of select="@name"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="demo:name">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="@name">
    <p>
      <xsl:value-of select="."/>
    </p>
  </xsl:template>

  <xsl:template match="demo:country/demo:city">

  </xsl:template>

  <xsl:template match="demo:country/demo:language">

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
