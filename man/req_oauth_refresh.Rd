% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oauth-flow-refresh.R
\name{req_oauth_refresh}
\alias{req_oauth_refresh}
\title{OAuth authentication with a refresh token}
\usage{
req_oauth_refresh(
  req,
  client,
  refresh_token = Sys.getenv("HTTR2_REFRESH_TOKEN"),
  scope = NULL,
  token_params = list()
)
}
\arguments{
\item{req}{A \link{request}.}

\item{client}{An \code{\link[=oauth_client]{oauth_client()}}.}

\item{refresh_token}{A refresh token. This is equivalent to a password
so shouldn't be typed into the console or stored in a script. Instead,
we recommend placing in an environment variable; the default behaviour
is to look in \code{HTTR2_REFRESH_TOKEN}.}

\item{scope}{Scopes to be requested from the resource owner.}

\item{token_params}{List containing additional parameters passed to the
\code{token_url}.}
}
\value{
A modified HTTP \link{request}.
}
\description{
This uses \code{\link[=oauth_flow_refresh]{oauth_flow_refresh()}} to generate an access token, which is
then used to authenticate the request with \code{\link[=req_auth_bearer_token]{req_auth_bearer_token()}}.
This is primarily useful for testing: you can manually execute another OAuth
flow (e.g. by calling \code{\link[=oauth_flow_auth_code]{oauth_flow_auth_code()}} or \code{\link[=oauth_flow_device]{oauth_flow_device()}}),
extract the refresh token from the result, and then save in an environment
variable for future use in automated tests.

When requesting an access token, the server may also return a new refresh
token. If this happens, \code{oauth_flow_refresh()} will warn, and you'll have
update your stored refresh token.
}
\examples{
client <- oauth_client("example", "https://example.com/get_token")
req <- request("https://example.com")
req \%>\% req_oauth_refresh(client)
}
