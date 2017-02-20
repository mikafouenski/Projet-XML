<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template name="scripts">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"/>
        <xsl:choose>
            <xsl:when test="ancestor::*">
                <script src="../../www-asset/materialize/js/materialize.min.js"/>
                <script src="../../www-asset/materialize/js/init.js"/>
            </xsl:when>
            <xsl:otherwise>
                <script src="../www-asset/materialize/js/materialize.min.js"/>
                <script src="../www-asset/materialize/js/init.js"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
