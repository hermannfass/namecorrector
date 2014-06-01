require 'csv'
require 'yaml' 
irregular_surnames = {}
name_data = CSV.parse(DATA).reject { |r| r.empty? }
name_data.each { |r| irregular_surnames[r[0].strip] = r[1].strip }
File.open('irregular_surnames.yaml', 'w') do |f|
    YAML.dump(irregular_surnames, f)
end

__END__
dipasquale, DiPasquale
mccall, McCall
maccall, MacCall
mccarthy, McCarthy
maccarthy, MacCarthy
mccarty, McCarty
maccarty, MacCarty
mcbride, McBride
macbride, MacBride
mcclain, McClain
macclain, MacClain
mcconnell, McConnell
macconnell, MacConnell
mccormick, McCormick
maccormick, MacCormick
mccoy, McCoy
maccoy, MacCoy
mcdaniel, McDaniel
macdaniel, MacDaniel
mcdonald, McDonald
macdonald, MacDonald
mcdonnell, McDonnell
macdonnell, MacDonnell
mcdowell, McDowell
macdowell, MacDowell
mcclure, McClure
macclure, MacClure
mccray, McCray
maccray, MacCray
mcfadden, McFadden
macfadden, MacFadden
mcgee, McGee
macgee, MacGee
mcguire, McGuire
macguire, MacGuire
mcintosh, McIntosh
macintosh, Macintosh
mckee, McKee
mackee, MacKee
mccullough, McCullough
maccullough, MacCullough
mcfarland, McFarland
macfarland, MacFarland
mcgowan, McGowan
macgowan, MacGowan
mcintyre, McIntyre
macintyre, MacIntyre
mckay, McKay
mackay, MacKay
mckenzie, McKenzie
mackenzie, MacKenzie
mckinney, McKinney
mackinney, MacKinney
mcknight, McKnight
macknight, MacKnight
mclain, McLain
maclain, MacLain
mclaughlin, McLaughlin
maclaughlin, MacLaughlin
mclean, McLean
maclean, MacLean
mcleod, McLeod
macleod, MacLeod
mcmahon, McMahon
macmahon, MacMahon
mcmillan, McMillan
macmillan, MacMillan
macneil, MacNeil
macneil, MacNeil
mcneill, McNeill
macneill, MacNeill
mcpherson, McPherson
macpherson, MacPherson