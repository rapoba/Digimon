## DITIGAL MONSTER

# ## 初期設定
# HTML内のcanvas要素を取得し、描画対象にする
canvas = document.getElementById 'sample'
ctx = canvas.getContext '2d'

# ドットを描く初期位置
baseX = 0
baseY = 0

util = {}
util.clearDot = ->
	ctx.clearRect 0, 0, 1000, 1000 

util.drawDot = (dots, start_x, start_y) ->
	console.log dots
	len = dots.length
	x = start_x
	y = start_y
	for i in [0...len]
		for j in [0...len]
			ctx.fillRect x, y, 10, 10 if dots[i][j] is 1
			x += 11
		x = baseX
		y += 11

meet = [
		[
			[0,1,1,1,0,0,0,0]
			[1,1,1,0,1,0,0,0]
			[1,1,1,1,0,1,0,0]
			[1,1,1,1,1,1,0,0]
			[0,1,1,1,0,1,0,0]
			[0,0,1,1,1,0,1,1]
			[0,0,0,0,0,1,0,1]
			[0,0,0,0,0,1,1,0]
		]
		[
			[0,1,1,0,0,0,0,0]
			[1,0,1,1,0,0,0,0]
			[1,1,1,1,1,1,0,0]
			[0,1,1,1,1,1,0,0]
			[0,1,1,1,0,1,0,0]
			[0,0,1,1,1,0,1,1]
			[0,0,0,0,0,1,0,1]
			[0,0,0,0,0,1,1,0]
		]
		[
			[0,1,1,0,0,0,0,0]
			[1,0,1,0,0,0,0,0]
			[1,1,0,1,0,0,0,0]
			[0,0,1,0,1,0,0,0]
			[0,0,0,1,0,1,0,0]
			[0,0,0,0,1,0,1,1]
			[0,0,0,0,0,1,0,1]
			[0,0,0,0,0,1,1,0]
		]
	]

# ### class SuperMonster
# モンスターのひな形
class SuperMonster
	constructor: ->
		@name = "zurumon"
		@waitingDots = [
				[
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0]
					[0,0,0,0,0,1,0,1,0,1,1,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0]
					[0,0,0,0,0,1,1,0,1,1,1,1,0,0,0,0]
					[0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0]
				]
				[
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0]
					[0,0,0,0,1,0,1,0,1,1,0,0,0,0,0,0]
					[0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0]
					[0,0,0,0,1,1,0,1,1,1,1,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0]
				]
			] 
	shout: (name) ->
		alert name 
	wait: ->
		f = 0
		setInterval =>
			util.clearDot()
			util.drawDot(@waitingDots[f%2], 0, 0)
			f += 1
		, 1000
	eat: -> 
		f = 0
		setInterval ->
			util.clearDot
			util.drawDot(meet[f%3], 0, 0)
			util.drawDot(@eatingDots[f%3], 20, 0)
			f += 1
		, 1000

# ### class Digitama
# デジタマを表すクラス
class Digitama extends SuperMonster
	constructor: ->
		@name = "digitama"
		# 待機状態のドットを２次元配列で宣言し、数フレーム用意する
		@waitingDots = [
				[
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0]
					[0,0,0,0,0,1,1,0,1,0,1,0,0,0,0,0]
					[0,0,0,0,1,0,1,0,1,1,0,1,0,0,0,0]
					[0,0,0,1,0,1,1,0,0,1,0,0,1,0,0,0]
					[0,0,0,1,0,1,0,0,0,1,1,0,1,0,0,0]
					[0,0,1,0,0,1,0,0,1,1,1,0,0,1,0,0]
					[0,0,1,0,1,1,0,0,1,0,1,1,0,1,0,0]
					[0,0,1,0,1,0,0,0,1,0,0,1,0,1,0,0]
					[0,0,1,0,1,0,0,0,1,0,0,1,0,1,0,0]
					[0,0,0,1,1,0,0,1,0,0,1,1,1,0,0,0]
					[0,0,0,0,1,1,1,1,0,0,1,1,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0]
				]
				[
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0]
					[0,0,0,0,0,0,1,1,0,1,0,1,0,0,0,0]
					[0,0,0,0,0,1,0,1,0,1,1,0,1,0,0,0]
					[0,0,0,0,1,0,1,1,0,0,1,0,0,1,0,0]
					[0,0,0,0,1,0,1,0,0,0,1,1,0,1,0,0]
					[0,0,0,1,0,0,1,0,0,1,1,1,0,0,1,0]
					[0,0,0,1,0,1,1,0,0,1,0,1,1,0,1,0]
					[0,0,0,1,0,1,0,0,0,1,0,0,1,0,1,0]
					[0,0,0,1,0,1,0,0,0,1,0,0,1,0,1,0]
					[0,0,0,0,1,1,0,0,1,0,0,1,1,1,0,0]
					[0,0,0,0,0,1,1,1,1,0,0,1,1,0,0,0]
					[0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0]
				]
			] 

###
class Zurumon extends Digitama
	constructor: ->
		@name = "zurumon"
		@waitingDots = [
				[
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0]
					[0,0,0,0,0,1,0,1,0,1,1,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0]
					[0,0,0,0,0,1,1,0,1,1,1,1,0,0,0,0]
					[0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0]
				]
				[
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0]
					[0,0,0,0,1,0,1,0,1,1,0,0,0,0,0,0]
					[0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0]
					[0,0,0,0,1,1,0,1,1,1,1,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0]
				]
			] 
		@eatingDots = [
				[
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0]
					[0,0,0,0,0,1,0,1,0,1,1,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0]
					[0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0]
					[0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0]
					[0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0]
					[0,0,0,0,1,1,0,0,0,1,1,1,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0]
				]
				[
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0]
					[0,0,0,0,1,0,1,0,1,1,0,0,0,0,0,0]
					[0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0]
					[0,0,0,0,1,1,0,1,1,1,1,0,0,0,0,0]
					[0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0]
				]
			] 
###

monster = new Digitama
# monster.shout(monster.name)
monster.wait()

###

# 空腹度、体力の初期値
hungry = 4
vitality = 4

# 待機状態にする
seen = "wait";

# ドットを描く関数
drawing = (dots) ->
	len = dots.length
	ctx.clearRect baseX, baseY, (10+1)*len, (10+1)*len
	x = baseX
	y = baseY
	for i in [0...len]
		for j in [0...len]
			ctx.fillRect x, y, 10, 10 if dots[i][j] is 1
			x += 11
		x = baseX
		y += 11


# モンスターを作る
monster = new Digitama

btnA = document.getElementById 'buttonA'
btnA.onclick = ->
	if monster.eatingDots
		ctx.clearRect 0, 0, 200, 200
		seen = "eat";
	
frame = 0;
setInterval ->
	switch seen
		when "wait"
			baseX = 0
			baseY = 0
			drawing monster.waitingDots[frame%2]
		when "eat"
			baseX = 0
			baseY = 88
			drawing meet[frame%3]
			baseX = 88
			baseY = 0
			drawing monster.eatingDots[frame%2]
	frame++
, 800

# 一定時間が経ったら進化する
setTimeout ->
	monster = new Zurumon
, 4950

###