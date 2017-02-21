<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template name="header">
        <xsl:param name="page-title"><xsl:value-of select="nom"/></xsl:param>
        <xsl:param name="preffix">../</xsl:param>

        <header>
            <nav class="top-nav" role="navigation">
                <div class="container">
                    <div class="nav-wrapper">
                        <ul id="slide-out" class="side-nav">
                            <li><a>
                                <xsl:attribute name="href"><xsl:value-of select="$preffix"/>index.html</xsl:attribute>
                                Index
                            </a></li>
                            <xsl:call-template name="menu_ue">
                                <xsl:with-param name="preffix" select="$preffix"/>
                            </xsl:call-template>
                            <xsl:call-template name="menu_intervenant">
                                <xsl:with-param name="preffix" select="$preffix"/>
                            </xsl:call-template>
                            <xsl:call-template name="menu_parcours">
                                <xsl:with-param name="preffix" select="$preffix"/>
                            </xsl:call-template>
                        </ul>
                        <a href="#" data-activates="slide-out" class="button-collapse show-on-large menu-control"><i class="material-icons">menu</i></a>
                        <a class="page-title">
                            <xsl:value-of select="$page-title"/>
                        </a>
                    </div>
                </div>
            </nav>
        </header>
    </xsl:template>

    <xsl:template name="menu_ue">
        <xsl:param name="preffix"/>
        <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
                <li>
                    <a class="collapsible-header">Unités d'enseignements<i class="material-icons">arrow_drop_down</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <xsl:for-each select="//ue">
                                <li><a class="truncate">
                                    <xsl:attribute name="href"><xsl:value-of select="$preffix"/>ue/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                    <xsl:value-of select="nom"/>
                                </a></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </li>
            </ul>
        </li>
    </xsl:template>

    <xsl:template name="menu_intervenant">
        <xsl:param name="preffix"/>
        <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
                <li>
                    <a class="collapsible-header">Intervenants<i class="material-icons">arrow_drop_down</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <xsl:for-each select="//intervenant">
                                <li><a class="truncate">
                                    <xsl:attribute name="href"><xsl:value-of select="$preffix"/>intervenant/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                    <xsl:value-of select="nom"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="prenom"/>
                                </a></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </li>
            </ul>
        </li>
    </xsl:template>

    <xsl:template name="menu_parcours">
        <xsl:param name="preffix"/>
        <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
                <li>
                    <a class="collapsible-header">Parcours<i class="material-icons">arrow_drop_down</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <xsl:for-each select="//parcours">
                                <li><a class="truncate">
                                    <xsl:attribute name="href"><xsl:value-of select="$preffix"/>parcours/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                    <xsl:value-of select="nom"/>
                                </a></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </li>
            </ul>
        </li>
    </xsl:template>

</xsl:stylesheet>
