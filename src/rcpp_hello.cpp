#include <Rcpp.h>

#include <cstdio>

using namespace Rcpp;

// This is a simple function using Rcpp that creates an R list
// containing a character vector and a numeric vector.
//
// Learn more about how to use Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//
// and browse examples of code using Rcpp at:
//
//   http://gallery.rcpp.org/
//

// Enable C++11 via this plugin (Rcpp 0.10.3 or later)

// [[Rcpp::plugins(cpp11)]]



// [[Rcpp::export]]
List rcpp_hello() {
  CharacterVector x = CharacterVector::create("foo", "bar");
  NumericVector y   = NumericVector::create(0.0, 1.0);
  List z            = List::create(x, y);
  return z;
}


class ICPWheatBlast {
private:
  DataFrame wData;
  std::string sdate, edate, fmt;
  std::string path;
  const std::string apiAddress = "http://dev.sisalert.com.br/apirest/api/v1/data/station/564f7cda16af35ca3decd3db/range/%s/%s/output/csv/avgT,avgH,solarR,totR,windS";

public:
  ICPWheatBlast(DataFrame weather_): wData(weather_) {}

  void loadWheaterData(std::string sdate_, std::string edate_, std::string fmt_) {
    // sprintf(path, apiAddress, sdate_, edate_);
    Rcpp::Rcout << "path" << std::endl;

  }

};


