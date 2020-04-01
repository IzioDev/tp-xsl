<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:demo="countries-part1.xml"
        version="2.0">

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
                <script src="/assets/bulma-collapsible.min.js"/>
                <link rel="stylesheet"
                      href="/assets/bulma-collapsible.min.css"/>
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
                                    <a href="#collapsible-countries-sort-name">Ordre alphabétique</a>
                                </li>
                                <li>
                                    <a href="#collapsible-countries-sort-population">Population</a>
                                </li>
                                <li>
                                    <a href="#collapsible-countries-sort-area">Superficie</a>
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
                                <article class="message">
                                    <div class="message-header">
                                        <p>
                                            <a href="#collapsible-countries-sort-name" data-action="collapse">Liste des
                                                pays par ordre croissant des noms
                                            </a>
                                        </p>
                                    </div>
                                    <div id="collapsible-countries-sort-name" class="message-body is-collapsible">
                                        <div class="message-body-content">
                                            <xsl:for-each select="/demo:countries/demo:country">
                                                <xsl:sort select="@name" order="ascending"></xsl:sort>
                                                <p>
                                                    <xsl:value-of select="@name"/>
                                                </p>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </article>

                                <article class="message">
                                    <div class="message-header">
                                        <p>
                                            <a href="#collapsible-countries-sort-population" data-action="collapse">
                                                Liste des pays par ordre croissant des populations
                                            </a>
                                        </p>
                                    </div>
                                    <div id="collapsible-countries-sort-population" class="message-body is-collapsible">
                                        <div class="message-body-content">
                                            <xsl:for-each select="/demo:countries/demo:country">
                                                <xsl:sort select="@population" data-type="number"
                                                          order="ascending"></xsl:sort>
                                                <p>
                                                    <xsl:value-of select="@name"/>
                                                </p>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </article>

                                <article class="message">
                                    <div class="message-header">
                                        <p>
                                            <a href="#collapsible-countries-sort-area" data-action="collapse">Liste des
                                                pays par ordre croissant des superficies
                                            </a>
                                        </p>
                                    </div>
                                    <div id="collapsible-countries-sort-area" class="message-body is-collapsible">
                                        <div class="message-body-content">
                                            <xsl:for-each select="/demo:countries/demo:country">
                                                <xsl:sort select="@area" data-type="number" order="ascending"/>
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
                            <script>
                                const bulmaCollapsibleInstances = bulmaCollapsible.attach('.is-collapsible');

                                bulmaCollapsibleInstances.forEach(bulmaCollapsibleInstance => {
                                console.log(bulmaCollapsibleInstance.collapsed());
                                });
                            </script>
                        </div>
                    </div>
                </div>
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

        <xsl:if test="count(demo:city) > 0">
            <svg xmlns="http://www.w3.org/2000/svg" width="600" height="100">
                <xsl:apply-templates select="demo:city" mode="city-histo-pop">
                    <xsl:sort select="demo:population" data-type="number" order="descending"/>
                </xsl:apply-templates>
            </svg>
        </xsl:if>

        <xsl:if test="count(demo:language) > 0">
            <h1 class="sub-title">Répartition des langages</h1>
            <svg xmlns="http://www.w3.org/2000/svg" width="300" height="120">
                <rect
                        x="0"
                        y="10"
                        width="50"
                        height="100"
                        fill="#EADADA"
                />
                <xsl:apply-templates select="demo:language" mode="language-repartition">
                    <xsl:sort select="@percentage" data-type="number" order="descending"/>
                </xsl:apply-templates>
            </svg>
        </xsl:if>
        <hr/>
    </xsl:template>

    <xsl:template match="demo:language" mode="language-repartition">
        <rect
                x="0"
                y="{110 - @percentage}"
                width="{50}"
                height="2"
                fill="blue"
        />
        <text x="56" y="{110 - @percentage + 6}"
              font-family="Verdana"
              font-size="12"
              xml:space="preserve"><xsl:value-of select="."></xsl:value-of> - <xsl:value-of select="@percentage"></xsl:value-of>%</text>
    </xsl:template>

    <xsl:template match="demo:country/demo:city" mode="city-histo-pop">
        <xsl:variable name="city_pop_max">
            <xsl:for-each select="../demo:city">
                <xsl:sort select="demo:population" order="descending" data-type="number"/>
                <xsl:if test="position()=1">
                    <xsl:value-of select="demo:population"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <rect
                x="{(600 div count(../demo:city) * position()) - 600 div count(../demo:city)}"
                y="{100 - demo:population div $city_pop_max * 100}"
                width="{600 div count(../demo:city)}"
                height="{demo:population div $city_pop_max * 100}"
                fill="blue"
                stroke="black"
        />
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
</xsl:stylesheet>
