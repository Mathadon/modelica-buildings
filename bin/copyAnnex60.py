#!/usr/bin/python
#####################################################################
# This script copies the Annex 60 library to the Buildings library.
#
# Todo: copy unit tests and test results.
#       - copy Images directory
#
# MWetter@lbl.gov                                          2011-05-15
#####################################################################
def replaceAnnex60String(filNam):
    """ Replace the string `Annex60` with `Buildings`.
    
    :param filNam: Name of the file
    """
    import os
    rep = {"Annex60": 
           "Buildings",
           "Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature": 
           "Buildings.HeatTransfer.Sources.PrescribedTemperature",
           "Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow":
           "Buildings.HeatTransfer.Sources.PrescribedHeatFlow"}

#           "Buildings.Media.ConstantPropertyLiquidWater":
#           "Buildings.Media.Water",
#           "Buildings.Media.GasesPTDecoupled.MoistAir":
#           "Buildings.Media.Air",
#           "Buildings.Media.GasesPTDecoupled.MoistAirUnsaturated":
#           "Buildings.Media.Air",
#           "Buildings.Media.GasesPTDecoupled.SimpleAir":
#           "Buildings.Media.Air",
#           "Buildings.Media.GasesConstantDensity.MoistAir":
#           "Buildings.Media.Air",
#           "Buildings.Media.GasesConstantDensity.MoistAirUnsaturated":
#           "Buildings.Media.Air",
#           "Buildings.Media.GasesConstantDensity.SimpleAir":
#           "Buildings.Media.Air",
#           "Buildings.Media.IdealGases.SimpleAir":
#           "Buildings.Media.Air",
#           "Buildings.Media.PerfectGases.MoistAir":
#           "Buildings.Media.Air",
#           "Buildings.Media.PerfectGases.MoistAirUnsaturated":
#           "Buildings.Media.Air"


    f = open(filNam, 'r')
    lines = list()
    for lin in f.readlines():
        if filNam.endswith(".mo") or filNam.endswith(".mos"):
            for ori, new in rep.iteritems():
                lin = string.replace(lin, ori, new)
        lines.append(lin)   
    f.close
    if filNam.startswith(BLDREFRES):
        # The reference results have the library in their file name.
        f = open(filNam.replace("Annex60", "Buildings"), 'w')
        os.remove(filNam)
    else:
        f = open(filNam, 'w')
    f.writelines(lines)
    f.close()

import os, string, fnmatch, os.path, sys
from os import makedirs
from os.path import isfile, join
import shutil

# --------------------------
# Global settings
root = "/Users/mwetter/proj/ldrd/bie/modeling/github"
ANNEX60HOME=os.path.abspath(root + "/iea-annex60/modelica-annex60/Annex60")
BLDHOME=os.path.abspath(root + "/lbl-srg/modelica-buildings/Buildings")
ANNEX60REFRES=os.path.join(ANNEX60HOME, "Resources", "ReferenceResults")
BLDREFRES=os.path.join(BLDHOME, "Resources", "ReferenceResults")


for root, dirs, files in os.walk(ANNEX60HOME):
    for fil in files:
        srcFil=os.path.join(root, fil)
        # Loop over all 
        # - .mo files except for top-level .mo file
        # - package.order
        # - .mos files
        # - ReferenceResults
        if (srcFil.endswith(".mo") and (not srcFil.endswith(os.path.join("Annex60", "package.mo")))) \
            or srcFil.endswith("package.order") \
            or srcFil.endswith(".mos") \
            or srcFil.startswith(ANNEX60REFRES) :
            desFil=srcFil.replace(ANNEX60HOME, BLDHOME)
            desPat=os.path.dirname(desFil)
            if not os.path.exists(desPat):
                os.makedirs(desPat)
            if not srcFil.endswith("package.order") or \
               srcFil.endswith("package.order") and not os.path.exists(desFil):
                shutil.copy2(srcFil, desFil)
                replaceAnnex60String(desFil)
        
