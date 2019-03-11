module Client
  ( Client
  , Response
  , create
  , destroy
  , index
  , newClient
  , show
  , showListResponse
  , showResponse
  , update
  ) where

import Control.Promise (Promise)
import Control.Promise as Aff
import Effect (Effect)
import Effect.Aff (Aff)

foreign import data Client :: Type
foreign import data Response :: Type
foreign import construct :: forall r. { | r } -> Effect Client
foreign import callMethod ::
  forall r. String -> Client -> { | r } -> Effect (Promise Response)
foreign import showListResponse :: Response -> String
foreign import showResponse :: Response -> String

create :: Client -> { file :: String, title :: String } -> Aff Response
create client params = Aff.toAffE (callMethod "create" client params)

destroy :: Client -> { id :: String } -> Aff Response
destroy client params = Aff.toAffE (callMethod "destroy" client params)

index :: Client -> {} -> Aff Response
index client params = Aff.toAffE (callMethod "index" client params)

newClient :: { apikey :: String , username :: String } -> Effect Client
newClient = construct

show :: Client -> { id :: String } -> Aff Response
show client params = Aff.toAffE (callMethod "show" client params)

update :: Client -> { id :: String, title :: String } -> Aff Response
update client params = Aff.toAffE (callMethod "update" client params)
