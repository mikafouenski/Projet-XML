<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template name="head">
        <xsl:param name="title"><xsl:value-of select="nom"/></xsl:param>
        <xsl:param name="preffix">../</xsl:param>
        <head>
            <title><xsl:value-of select="$title"/></title>
            <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
            <link type="text/css" rel="stylesheet" media="screen,projection">
                <xsl:attribute name="href"><xsl:value-of select="$preffix"/>../www-asset/materialize/css/materialize.css</xsl:attribute>
            </link>
            <link type="text/css" rel="stylesheet" media="screen,projection">
                <xsl:attribute name="href"><xsl:value-of select="$preffix"/>../www-asset/materialize/css/style.css</xsl:attribute>
            </link>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        </head>
    </xsl:template>
</xsl:stylesheet>
