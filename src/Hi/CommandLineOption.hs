module Hi.CommandLineOption
  ( CommandLineOption(..)
  , commandLineOption
  ) where

import           Options.Applicative

data CommandLineOption = CommandLineOption
                       { moduleName              :: Maybe String
                       , packageName             :: String
                       , author                  :: Maybe String
                       , email                   :: Maybe String
                       , repository              :: Maybe String
                       , configFilePath          :: Maybe String
                       , initializeGitRepository :: Maybe Bool
                       } deriving (Eq, Ord, Show)

commandLineOption :: Parser CommandLineOption
commandLineOption = CommandLineOption
   <$> optional (strOption ( short 'm' <> long "moduleName" <> metavar "Module.Name" <> help "Name of Module" ))
   <*> (strOption ( short 'p' <> long "package-name" <> metavar "package-name" <> help "Name of package" )
       <|> argument str (metavar "package-name" <> help "Name of package"))
   <*> optional ( strOption ( short 'a' <> long "author"      <> metavar "NAME"         <> help "Name of the project's author" ))
   <*> optional ( strOption ( short 'e' <> long "email"       <> metavar "EMAIL"        <> help "Email address of the maintainer" ))
   <*> optional ( strOption ( short 'r' <> long "repository"  <> metavar "REPOSITORY"   <> help "Template repository" ))
   <*> optional ( strOption ( long "configuration-file"       <> help "Use specified configuration file"))
   <*> optional ( switch    ( long "initialize-git-repository" <> help "Initialize with git repository"))
