class ClojureAT11131452 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.3.1452/clojure-tools-1.11.3.1452.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.3.1452.tar.gz"
  sha256 "347bff25d99e99eb4ed65518e56d0f4089eca428491530504981e6620322151f"
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
