module Test.Main where

import Prelude

import Data.String.Regex (test)
import Effect (Effect)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner.Node (runSpecAndExitProcess)
import UrlRegexSafe (defaultUrlRegexSafeOptions, urlRegexSafe)

main :: Effect Unit
main = do
  let regex = urlRegexSafe defaultUrlRegexSafeOptions

  runSpecAndExitProcess [ consoleReporter ] do
    describe "urlRegexSafe" do
      it "matches https://example.com" $
        test regex "https://example.com" `shouldEqual` true

      it "matches http://localhost:8080" $
        test regex "http://localhost:8080" `shouldEqual` true

      it "matches myftp://invalid.protocol.com" $
        test regex "myftp://invalid.protocol.com" `shouldEqual` true

      it "does not match not-a-url" $
        test regex "not-a-url" `shouldEqual` false

      it "matches http://192.168.0.1" $
        test regex "http://192.168.0.1" `shouldEqual` true

      it "matches http://[::1]" $
        test regex "http://[::1]" `shouldEqual` true
