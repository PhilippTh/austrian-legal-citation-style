-- l3build configuration for AZR biblatex citation style tests
module = "azr"

-- Test configuration
checkengines = {"pdftex"}
checkformat  = "latex"
testfiledir  = "testfiles"
testsuppdir  = "support"

-- Support files that need to be copied to the test build directory
-- biblatex.cfg: our citation style under test
-- references.bib: shared test bibliography
checksuppfiles = {"references.bib", "biblatex.cfg"}

-- We need: pdflatex (run 1) -> biber -> pdflatex (run 2)
-- l3build's runtest_tasks lets us interleave biber between LaTeX runs
checkruns = 2

runtest_tasks = function(name, run, typ, engine)
  if run == 1 then
    -- After the first LaTeX run, execute biber to process bibliography
    return "biber " .. name
  end
  -- No extra task after subsequent runs
  return ""
end
