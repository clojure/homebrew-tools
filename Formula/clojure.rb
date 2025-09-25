class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.3.1577/clojure-tools-1.12.3.1577.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.3.1577.tar.gz"
  sha256 "bbf8513ae88b9873e9781ae86adcb560b81209c66fe94cbe72428af39b1ebacc"
  license "EPL-1.0"

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -M -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -M -e \"(+ 1 1)\"").strip
    end
  end
end
