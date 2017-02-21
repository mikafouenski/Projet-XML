<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template name="scripts">
        <xsl:param name="preffix">../</xsl:param>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"/>
        <script>
            <xsl:attribute name="src"><xsl:value-of select="$preffix"/>../www-asset/materialize/js/materialize.min.js</xsl:attribute>
        </script>
        <script>
            <xsl:attribute name="src"><xsl:value-of select="$preffix"/>../www-asset/materialize/js/init.js</xsl:attribute>
        </script>
    </xsl:template>
</xsl:stylesheet>
