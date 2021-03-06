package routes

import (
	"net/http"

	"github.com/code-golf/code-golf/lang"
	"github.com/code-golf/code-golf/session"
)

// About serves GET /about
func About(w http.ResponseWriter, r *http.Request) {
	if golfer := session.Golfer(r); golfer != nil {
		awardTrophy(session.Database(r), golfer.ID, "rtfm")
	}

	render(w, r, "about", "About", lang.List)
}
