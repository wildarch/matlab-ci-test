simOut = sim('tester', 'CaptureErrors', 'on');
execInfo = simOut.getSimulationMetadata.ExecutionInfo;
if ~isempty(execInfo.ErrorDiagnostic)
    disp(execInfo.ErrorDiagnostic(0).message);
    exit(1);
elseif ~isempty(execInfo.WarningDiagnostics)
    for w = transpose(execInfo.WarningDiagnostics(:))
        disp(w.Diagnostic.message);
    end
    exit(1);
else
    exit(0);
end
