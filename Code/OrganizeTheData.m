FN=fieldnames(Measurements);
for FNC=1:size(FN);
    for abc=1:size(opt_name,2);
        Labels{FNC}=erase(string(FN{FNC}),string(opt_name{abc}));
    end
end
ct=1:size(FN,1);
AC1N_names=FN(ct(startsWith(FN,'AC1N')));
AC1N_labels=FN(ct(startsWith(FN,'AC1N')));
AC1N=[];
for i=1:size(AC1N_names,1)
AC1N=[AC1N,Measurements.(AC1N_names{i})];
end
AC1E_names=FN(ct(startsWith(FN,'AC1E')));
AC1E_labels=FN(ct(startsWith(FN,'AC1E')));
AC1E=[];
for i=1:size(AC1E_names,1)
AC1E=[AC1E,Measurements.(AC1E_names{i})];
end
ACRN_names=FN(ct(startsWith(FN,'ACRN')));
ACRN_labels=FN(ct(startsWith(FN,'ACRN')));
ACRN=[];
for i=1:size(ACRN_names,1)
ACRN=[ACRN,Measurements.(ACRN_names{i})];
end
ACRE_names=FN(ct(startsWith(FN,'ACRE')));
ACRE_labels=FN(ct(startsWith(FN,'ACRE')));
ACRE=[];
for i=1:size(ACRE_names,1)
ACRE=[ACRE,Measurements.(ACRE_names{i})];
end
ACBU_names=FN(ct(startsWith(FN,'ACBU')));
ACBU_labels=FN(ct(startsWith(FN,'ACBU')));
ACBU=[];
for i=1:size(ACBU_names,1)
ACBU=[ACBU,Measurements.(ACBU_names{i})];
end
ACBE_names=FN(ct(startsWith(FN,'ACBE')));
ACBE_labels=FN(ct(startsWith(FN,'ACBE')));
ACBE=[];
for i=1:size(ACBE_names,1)
ACBE=[ACBE,Measurements.(ACBE_names{i})];
end