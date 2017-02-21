<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template name="creer_index">
        <xsl:result-document method="html" href="www/index.html">
            <xsl:text disable-output-escaping='yes'>&lt;!doctype html&gt;</xsl:text>
            <html>
                <xsl:call-template name="head">
                    <xsl:with-param name="title">Données Master</xsl:with-param>
                    <xsl:with-param name="preffix"></xsl:with-param>
                </xsl:call-template>
                <body>
                    <xsl:call-template name="header">
                        <xsl:with-param name="page-title">Données Master</xsl:with-param>
                        <xsl:with-param name="preffix"></xsl:with-param>
                    </xsl:call-template>
                    <main>
                        <div class="container">
                            <p>ECCRIIIIIRRRRRRRREEEEE IIIIIIIIICCCCCCCCCIIIIIII !!! :O</p>
                        </div>
                        <xsl:call-template name="scripts">
                            <xsl:with-param name="preffix"></xsl:with-param>
                        </xsl:call-template>
                    </main>
                    <xsl:call-template name="footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
