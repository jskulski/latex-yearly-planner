#!/usr/bin/env bash
export PLANNER_YEAR=2022
export PASSES=1
export CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/rm2.base.yaml,cfg/rm2.breadcrumb.default.dailycal.yaml"
export CONFIG_FILES="$CFG"
export NAME="jsk.rm2"

# sh preview.sh $PLANNER_YEAR
# open planner.$PLANNER_YEAR.pdf

sh single.sh
open $NAME.pdf

