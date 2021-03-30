
%{
# Zygosity - we can add here exact definitions for the enum
-> subject.Subject
-> subject.Allele
---
zygosity: enum("Present", "Absent", "Homozygous Negative", "Homozygous Positive", "Heterozygous")
zygosity_ts=CURRENT_TIMESTAMP: timestamp
%}

classdef Zygosity < dj.Manual

end
