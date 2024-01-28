#!/usr/bin/env bash
# This file will be sourced by cacao-setup and high-level cacao scripts


export CACAO_LOOPNAME="tweeter-vispyr"
export CACAO_LOOPNUMBER="1"

# ====== DEFORMABLE MIRROR ==========

# Deformable mirror (DM) size
# If DM is single dimension, enter "1" for DMsize
#
export CACAO_DMINDEX="01"    # Hardware DM - connected to physical DM
export CACAO_DMSIMINDEX="11" # Simulation DM
export CACAO_DMxsize="50"
export CACAO_DMysize="50"

# OPTIONAL: DM alignment
#export CACAO_DM_beam_xcent="24.2"
#export CACAO_DM_beam_ycent="23.5"
#export CACAO_DM_beam_rad="24.5"

# 1 if DM actuators are on a coordinate grid
# This informs processes if a spatial relationship exists
# between DM actuators
export CACAO_DMSPATIAL="1"



# ====== DIRECTORIES ================

# Root directory
export CACAO_LOOPROOTDIR="${CACAO_LOOPNAME}-rootdir"

# Run directory. This is a subdirectory of rootdir
# processes run in CACAO_LOOPROOTDIR/CACAO_LOOPRUNDIR
export CACAO_LOOPRUNDIR="${CACAO_LOOPNAME}-rundir"


# input WFS stream
export CACAO_WFSSTREAM="camwfs"    # Hardware stream, connected to physical camera

# Specify that WFS stream is not raw image, but processed WFS signal
# If set to ON, this turns off intensity scaling
export CACAO_WFSSTREAM_PROCESSED="OFF"

export CACAO_LOOPDATALOGDIR="$(pwd)/datalogdir"



# ========================================
#       FPS processes to be set up
# ========================================

# DM combination
# Manages mutipe DM channels
#
export CACAO_FPSPROC_DMCH2DISP="ON"

# DM turbulence simulator
export CACAO_FPSPROC_DMATMTURB="ON"


# Measure hardware latency
#
export CACAO_FPSPROC_MLAT="ON"

# Acquire WFS stream
#
export CACAO_FPSPROC_ACQUWFS="ON"


# Acquire linear RM (zonal)
#
export CACAO_FPSPROC_MEASURELINRESP="ON"



# Compute control matrix - straight
#
export CACAO_FPSPROC_COMPSTRCM="ON"



# Extract control modes from WFS using MVM
#
export CACAO_FPSPROC_MVMGPU_WFS2CMODEVAL="ON"

# Modal control filtering
#
export CACAO_FPSPROC_MODALFILTERING="ON"

# Compute DM command from control mode values
#
export CACAO_FPSPROC_MVMGPU_CMODEVAL2DM="ON"

# Compute DM command from control mode offload values
#
export CACAO_FPSPROC_MVMGPU_CMODEVALOFFLOAD2DM="ON"


# Zero Point Offset from DM to WFS
#
export CACAO_FPSPROC_MVMGPU_ZPO="ON"


# Modal control statistics
#
export CACAO_FPSPROC_MODALCTRL_STATS="ON"


# Reconstruct DM shape from OL mode values
#
export CACAO_FPSPROC_MVMGPU_OLMODEVAL2DM="ON"


# Reconstruct DM shape from OL mode values
#
export CACAO_FPSPROC_MVMGPU_WFSMODEVAL2DM="ON"


# Modal control DM comb
#export CACAO_FPSPROC_CMDMCOMB="ON"

# Modal response matrix using control modes
##export CACAO_FPSPROC_ACQLINCMRM="ON"

# Predictive control
#
#export CACAO_PF_NBBLOCK=6
#export CACAO_FPSPROC_MKPF="ON"
#export CACAO_FPSPROC_APPLYPF="ON"





# User-provided additions to cacaovars

# Run local fpslistadd files
#
shopt -s nullglob # needed to suppress error if no file found
echo "Looking for local cacaovars modifiers ($(pwd)/../cacaovars-${CACAO_LOOPNAME}*)"
for cvarf in ../cacaovars-${CACAO_LOOPNAME}*; do
echo "Processing cacaovars file ${cvarf}"
. ./${cvarf}
done
shopt -u nullglob #revert nullglob back to it's normal default state

