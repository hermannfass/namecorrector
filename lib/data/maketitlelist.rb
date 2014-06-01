require 'yaml' 
titles = []
DATA.select{ |r| r.match(/\w/) }.each do |r|
    titles << r.strip 
end
File.open('titles.yaml', 'w') do |f|
    YAML.dump(titles, f)
end

__END__
Dr.
Dr.med.
Dr. med.
Dr. rer. nat.
Dr.rer.nat.
Dr. sc. nat.
Dr.sc.nat.
Dr. phil. nat.
Dr.phil.nat.
Dr.-Ing.
Dr. mont.
Dr.mont.
Dr. techn.
Dr.techn.
Dr.sc.agr.
Dr. sc. agr.
Dr.sc.hum.
Dr. sc. hum.
Dr.sc.inf.
Dr. sc. inf.
Dr.sc.inf.med.
Dr. sc. inf. med.
Dr.sc.inf.biomed.
Dr. sc. inf. biomed.
Dr.sc.math.
Dr. sc. math.
Dr.scient.med.
Dr. scient. med.
Dr.sc.mus.
Dr. sc. mus.
Dr.sc.oec.
Dr. sc. oec.
Dr.sc.pol.
Dr. sc. pol.
Dr.sc.soc.
Dr. sc. soc.
Sc.D.
Sc. D.
D.Sc.
D. Sc.
S.D.
S. D.
Dr.Sc.
Dr. Sc.
D. Sc.
DrSc.
DSc.
PhD
Ph. D.
Ph. Dr.
PhDr.
Dr.h.c.
Dr. h. c.

Prof.
Ing.
Phil.
MBA
MSc.
MSc

