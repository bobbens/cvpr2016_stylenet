local nn    = require 'nn'
local image = require 'image'

local model       = torch.load( 'stylenet.t7' )
local stylenet    = model.stylenet
local trainmean   = model.mean
local trainstd    = model.std

local function loadImage(path)
   local input = image.load(path)
   if input:dim() == 2 then -- 1-channel image loaded as 2D tensor
      input = input:view(1,input:size(1), input:size(2)):repeatTensor(3,1,1)
   elseif input:dim() == 3 and input:size(1) == 1 then -- 1-channel image
      input = input:repeatTensor(3,1,1)
   elseif input:dim() == 3 and input:size(1) == 3 then -- 3-channel image
   elseif input:dim() == 3 and input:size(1) == 4 then -- image with alpha
      input = input[{{1,3},{},{}}]
   else
      print(#input)
      error('not 2-channel or 3-channel image')
   end
   for i=1,3 do -- channels
      input[{{i},{},{}}]:add(-trainmean[i]):div(trainstd[i])
   end
   return input:float()
end

local function get_descriptor( path )
   local I = loadImage( path )
   I = image.scale( I, 256, 384 )
   I = I:reshape( 1, I:size(1), I:size(2), I:size(3) )
   return stylenet:forward( I )[1]:clone()
end

local images = { '002724.jpg', '002831.jpg', '002861.jpg', '003194.jpg', '003212.jpg', '004178.jpg', '004193.jpg' }
local descriptors = {}
for k,v in ipairs(images) do
   descriptors[v] = get_descriptor( v )
end

local D = torch.Tensor( #images, #images )
for i,m in ipairs( images ) do
   for j,n in ipairs( images ) do
      D[i][j] = torch.norm( descriptors[m]-descriptors[n] )
   end
end
print( D )


