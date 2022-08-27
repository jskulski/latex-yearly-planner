package mos

import (
	"bytes"
	"fmt"

	"github.com/kudrykv/latex-yearly-planner/app2/planners/common"
	types2 "github.com/kudrykv/latex-yearly-planner/app2/types"
	"github.com/kudrykv/latex-yearly-planner/app3/types"
)

type Planner struct {
	parameters Parameters
}

func New(parameters Parameters) *Planner {
	return &Planner{parameters: parameters}
}

var ErrUnknownSection = fmt.Errorf("unknown section")

func (r *Planner) Generate() (types.NamedBuffers, error) {
	sections := r.sections()

	result := make(types.NamedBuffers, 0, len(r.parameters.Sections))

	for _, name := range r.parameters.Sections {
		section, ok := sections[name]
		if !ok {
			return nil, fmt.Errorf("lookup %s: %w", name, ErrUnknownSection)
		}

		buff, err := section()
		if err != nil {
			return nil, fmt.Errorf("run %s: %w", name, err)
		}

		result = append(result, types.NamedBuffer{Name: name, Buffer: buff})
	}

	return result, nil
}

func (r *Planner) sections() map[string]types2.SectionFunc {
	return map[string]types2.SectionFunc{
		common.DailiesSection: r.dailiesSection,
	}
}

func (r *Planner) dailiesSection() (*bytes.Buffer, error) {
	panic("not implemented")
}

func (r *Planner) RunTimes() int {
	return 2
}

func (r *Planner) Document() types.Document {
	return r.parameters.Document
}
