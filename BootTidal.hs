:set -XOverloadedStrings
:set prompt ""

import Sound.Tidal.Context

import System.IO (hSetEncoding, stdout, utf8)
hSetEncoding stdout utf8

-- total latency = oLatency + cFrameTimespan
tidal <- startTidal (superdirtTarget {oLatency = 0.1, oAddress = "127.0.0.1", oPort = 57120}) (defaultConfig {cVerbose = True, cFrameTimespan = 1/20})

:{
let only = (hush >>)
    p = streamReplace tidal
    hush = streamHush tidal
    panic = do hush
               once $ sound "superpanic"
    list = streamList tidal
    mute = streamMute tidal
    unmute = streamUnmute tidal
    unmuteAll = streamUnmuteAll tidal
    unsoloAll = streamUnsoloAll tidal
    solo = streamSolo tidal
    unsolo = streamUnsolo tidal
    once = streamOnce tidal
    first = streamFirst tidal
    asap = once
    nudgeAll = streamNudgeAll tidal
    all = streamAll tidal
    resetCycles = streamResetCycles tidal
    setcps = asap . cps
    getcps = streamGetcps tidal
    getnow = streamGetnow tidal
    xfade i = transition tidal True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t = transition tidal True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t = transition tidal True (Sound.Tidal.Transition.histpan t) i
    wait i t = transition tidal True (Sound.Tidal.Transition.wait t) i
    waitT i f t = transition tidal True (Sound.Tidal.Transition.waitT f t) i
    jump i = transition tidal True (Sound.Tidal.Transition.jump) i
    jumpIn i t = transition tidal True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t = transition tidal True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t = transition tidal True (Sound.Tidal.Transition.jumpMod t) i
    mortal i lifespan release = transition tidal True (Sound.Tidal.Transition.mortal lifespan release) i
    interpolate i = transition tidal True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition tidal True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i = transition tidal True (Sound.Tidal.Transition.clutch) i
    clutchIn i t = transition tidal True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i = transition tidal True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t = transition tidal True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t = transition tidal False (Sound.Tidal.Transition.mortalOverlay t) i
    d1 = p 1 . (|< orbit 0)
    d2 = p 2 . (|< orbit 1)
    d3 = p 3 . (|< orbit 2)
    d4 = p 4 . (|< orbit 3)
    d5 = p 5 . (|< orbit 4)
    d6 = p 6 . (|< orbit 5)
    d7 = p 7 . (|< orbit 6)
    d8 = p 8 . (|< orbit 7)
    d9 = p 9 . (|< orbit 8)
    d10 = p 10 . (|< orbit 9)
    d11 = p 11 . (|< orbit 10)
    d12 = p 12 . (|< orbit 11)
    d13 = p 13
    d14 = p 14
    d15 = p 15
    d16 = p 16
:}

:{
let getState = streamGet tidal
    setI = streamSetI tidal
    setF = streamSetF tidal
    setS = streamSetS tidal
    setR = streamSetR tidal
    setB = streamSetB tidal
:}

-- modulators
mod11 = pF "mod11"
mod12 = pF "mod12"
mod13 = pF "mod13"
mod14 = pF "mod14"
mod15 = pF "mod15"
mod16 = pF "mod16"
mod21 = pF "mod21"
mod22 = pF "mod22"
mod23 = pF "mod23"
mod24 = pF "mod24"
mod25 = pF "mod25"
mod26 = pF "mod26"
mod31 = pF "mod31"
mod32 = pF "mod32"
mod33 = pF "mod33"
mod34 = pF "mod34"
mod35 = pF "mod35"
mod36 = pF "mod36"
mod41 = pF "mod41"
mod42 = pF "mod42"
mod43 = pF "mod43"
mod44 = pF "mod44"
mod45 = pF "mod45"
mod46 = pF "mod46"
mod51 = pF "mod51"
mod52 = pF "mod52"
mod53 = pF "mod53"
mod54 = pF "mod54"
mod55 = pF "mod55"
mod56 = pF "mod56"
mod61 = pF "mod61"
mod62 = pF "mod62"
mod63 = pF "mod63"
mod64 = pF "mod64"
mod65 = pF "mod65"
mod66 = pF "mod66"
-- operator envelope generator levels
eglevel11 = pF "eglevel11"
eglevel12 = pF "eglevel12"
eglevel13 = pF "eglevel13"
eglevel14 = pF "eglevel14"
eglevel21 = pF "eglevel21"
eglevel22 = pF "eglevel22"
eglevel23 = pF "eglevel23"
eglevel24 = pF "eglevel24"
eglevel31 = pF "eglevel31"
eglevel32 = pF "eglevel32"
eglevel33 = pF "eglevel33"
eglevel34 = pF "eglevel34"
eglevel41 = pF "eglevel41"
eglevel42 = pF "eglevel42"
eglevel43 = pF "eglevel43"
eglevel44 = pF "eglevel44"
eglevel51 = pF "eglevel51"
eglevel52 = pF "eglevel52"
eglevel53 = pF "eglevel53"
eglevel54 = pF "eglevel54"
eglevel61 = pF "eglevel61"
eglevel62 = pF "eglevel62"
eglevel63 = pF "eglevel63"
eglevel64 = pF "eglevel64" 
-- operator envelope generator rates
egrate11 = pF "egrate11"
egrate12 = pF "egrate12"
egrate13 = pF "egrate13"
egrate14 = pF "egrate14"
egrate21 = pF "egrate21"
egrate22 = pF "egrate22"
egrate23 = pF "egrate23"
egrate24 = pF "egrate24"
egrate31 = pF "egrate31"
egrate32 = pF "egrate32"
egrate33 = pF "egrate33"
egrate34 = pF "egrate34"
egrate41 = pF "egrate41"
egrate42 = pF "egrate42"
egrate43 = pF "egrate43"
egrate44 = pF "egrate44"
egrate51 = pF "egrate51"
egrate52 = pF "egrate52"
egrate53 = pF "egrate53"
egrate54 = pF "egrate54"
egrate61 = pF "egrate61"
egrate62 = pF "egrate62"
egrate63 = pF "egrate63"
egrate64 = pF "egrate64"
-- operator output levels
amp1 = pF "amp1"
amp2 = pF "amp2"
amp3 = pF "amp3"
amp4 = pF "amp4"
amp5 = pF "amp5"
amp6 = pF "amp6"
-- operator frequency ratios
ratio1 = pF "ratio1"
ratio2 = pF "ratio2"
ratio3 = pF "ratio3"
ratio4 = pF "ratio4"
ratio5 = pF "ratio5"
ratio6 = pF "ratio6"
-- operator frequency detuners
detune1 = pF "detune1"
detune2 = pF "detune2"
detune3 = pF "detune3"
detune4 = pF "detune4"
detune5 = pF "detune5"
detune6 = pF "detune6"
-- other
feedback = pF "feedback"
lfofreq = pF "lfofreq"
lfodepth = pF "lfodepth"


:set prompt "tidal> "
:set prompt-cont ""
