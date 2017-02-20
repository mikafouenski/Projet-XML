<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template name="head">
        <head>
            <title>Données Master</title>
            <!--Import Google Icon Font-->
            <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
            <!--Import materialize.css-->
            <xsl:choose>
                <xsl:when test="ancestor::*">
                    <link type="text/css" rel="stylesheet" href="../../www-asset/materialize/css/materialize.css" media="screen,projection"/>
                    <link type="text/css" rel="stylesheet" href="../../www-asset/materialize/css/style.css" media="screen,projection"/>
                </xsl:when>
                <xsl:otherwise>
                    <link type="text/css" rel="stylesheet" href="../www-asset/materialize/css/materialize.css" media="screen,projection"/>
                    <link type="text/css" rel="stylesheet" href="../www-asset/materialize/css/style.css" media="screen,projection"/>
                </xsl:otherwise>
            </xsl:choose>
            <!--Let browser know website is optimized for mobile-->
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        </head>
    </xsl:template>
</xsl:stylesheet>
