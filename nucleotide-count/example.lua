local DNA = {}

function DNA:new(str)
  self.__index = self
  local nc = { A = 0, T = 0, C = 0, G = 0}
  local n = { 'A','T','C','G','U'}
  for i =1,str:len() do
    local c = str:sub(i,i)
    nc[c]= nc[c] + 1
  end
  return setmetatable({nucleotideCounts = nc, NUCLEOTIDES = n }, self)
end

function DNA:count(symbol)
  if  ( self.nucleotideCounts[symbol] ) then 
    return self.nucleotideCounts[symbol]
  end  
  for _,v in pairs(self.NUCLEOTIDES) do
    if v == symbol then
      return 0
    end
  end
  return error("Invalid Nucleotide")
end

return DNA