set -eo pipefail

CURRENT_YEAR=$(date +"%Y")
NEXT_YEAR=$((CURRENT_YEAR+1))

_configurations=(
  1 "cfg/base.yaml,cfg/template_breadcrumb.yaml,cfg/sn_a5x.breadcrumb.default.yaml" "sn_a5x.breadcrumb.default"
  2 "cfg/base.yaml,cfg/template_months_on_side.yaml,cfg/sn_a5x.mos.default.yaml"    "sn_a5x.mos.default"

  1 "cfg/base.yaml,cfg/rm2.base.yaml,cfg/template_breadcrumb.yaml,cfg/rm2.breadcrumb.default.yaml" "rm2.breadcrumb.default"
  2 "cfg/base.yaml,cfg/rm2.base.yaml,cfg/template_months_on_side.yaml,cfg/rm2.mos.default.yaml"    "rm2.mos.default"

  1 "cfg/base.yaml,cfg/rm2_ddvk.base.yaml,cfg/template_breadcrumb.yaml,cfg/rm2.breadcrumb.default.yaml" "rm2_ddvk.breadcrumb.default"
  2 "cfg/base.yaml,cfg/rm2_ddvk.base.yaml,cfg/template_months_on_side.yaml,cfg/rm2.mos.default.yaml"    "rm2_ddvk.mos.default"

  1 "cfg/base.yaml,cfg/rm2_ddvk_lh.base.yaml,cfg/template_breadcrumb.yaml,cfg/rm2.breadcrumb.default.yaml" "rm2_ddvk_lh.breadcrumb.default"
  2 "cfg/base.yaml,cfg/rm2_ddvk_lh.base.yaml,cfg/template_months_on_side.yaml,cfg/rm2.mos.default.yaml"    "rm2_ddvk_lh.mos.default"
)

_configurations_len=${#_configurations[@]}

function createPDFs() {
  for _year in $CURRENT_YEAR $NEXT_YEAR; do
    for _idx in $(seq 0 3 $((_configurations_len-1))); do
      _passes=${_configurations[_idx]}
      _cfg=${_configurations[_idx+1]}
      _name=${_configurations[_idx+2]}

      PLANNER_YEAR="${_year}" PASSES="${_passes}" CFG="${_cfg}" NAME="${_name}.${_year}" ./single.sh
    done
  done
}

function mvDefaultTo() {
  for filename in ./*pdf; do
    _newname=$(echo "$filename" | perl -pe "s/default/$1/g")
    mv "$filename" "$_newname"
  done
}

# default planners
createPDFs
mv ./*pdf pile

# sunday-first planners
sed -i 's/weekstart: 1/weekstart: 0/' cfg/base.yaml
createPDFs
git restore cfg/base.yaml
mvDefaultTo "sunday_first"
mv ./*pdf pile

# am/pm time
sed -i 's/ampmtime: false/ampmtime: true/' cfg/base.yaml
createPDFs
git restore cfg/base.yaml
mvDefaultTo "ampm"
mv ./*pdf pile

# sunday-first + am/pm
sed -i 's/weekstart: 1/weekstart: 0/' cfg/base.yaml
sed -i 's/ampmtime: false/ampmtime: true/' cfg/base.yaml
createPDFs
git restore cfg/base.yaml
mvDefaultTo "sunday_first.ampm"
mv ./*pdf pile