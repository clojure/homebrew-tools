class ClojureAT11211558 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.1.1558/clojure-tools-1.12.1.1558.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.1.1558.tar.gz"
  sha256 "ef8b51e0d521ee671b2ffb22605be21e3fabb441baf5af50cdc1072e6073bf58"
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
