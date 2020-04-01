<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:demo="countries-part1.xml"
        version="2.0">

    <xsl:template match="demo:countries">
        <html>
            <head></head>
            <body>
                <div class="container">
                    <svg width="1200" height="800">
                        <xsl:variable name="country_pop_max">
                            <xsl:for-each select="demo:country">
                                <xsl:sort select="@population" order="descending" data-type="number"/>
                                <xsl:if test="position()=1">
                                    <xsl:value-of select="@population"/>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:for-each select="demo:country">
                            <xsl:sort select="@population" order="descending" data-type="number" />
                            <xsl:if test="not(position() > 10)">
                                <rect
                                        x="{(1200 div 10 * position()) - 1200 div 10}"
                                        y="{700 - (@population div $country_pop_max * 100) * 7}"
                                        width="{1200 div 10}"
                                        height="{(@population div $country_pop_max * 100)  * 7}"
                                        fill="blue"
                                        stroke="black"
                                />
                                <text x="{120 * position() - 120}" y="{725}"
                                      font-family="Verdana"
                                      font-size="10"
                                      xml:space="preserve"><xsl:value-of select="@name"></xsl:value-of></text>
                                <text x="{120 * position() - 120}" y="{750}"
                                      font-family="Verdana"
                                      font-size="10"
                                      xml:space="preserve"><xsl:value-of select="@population"></xsl:value-of> Habitants</text>
                            </xsl:if>
                        </xsl:for-each>
                    </svg>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
