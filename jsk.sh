#!/usr/bin/env bash
export PLANNER_YEAR=2022
export PASSES=1
export CFG="cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/rm2.breadcrumbs.jsk.yaml"
export CONFIG_FILES="$CFG"
export NAME="jsk.rm2"

# single.sh
# open $NAME.pdf

sh preview.sh $PLANNER_YEAR
open planner.$PLANNER_YEAR.pdf

