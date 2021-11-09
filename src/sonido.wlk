import wollok.game.*

object soundMock {
	
	method pause(){}
	
	method paused() = true
	
	method play(){}
	
	method played() = false
	
	method resume(){}
	
	method shouldLoop(looping){}
	
	method shouldLoop() = false
	
	method stop(){}
	
	method volume(newVolume){}
	
	method volume() = 0
}


object soundProducer {
	var provider = game
	
	method provider(_provider){
		provider = _provider
	}
	
	method sound(audioFile) = provider.sound(audioFile)	
}

object soundProviderMock {
	
	method sound(audioFile) = soundMock	
}
