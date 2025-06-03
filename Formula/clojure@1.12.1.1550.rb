class ClojureAT11211550 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.1.1550/clojure-tools-1.12.1.1550.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.1.1550.tar.gz"
  sha256 "906c625679c72e7035875988a46392a1d83d16ee1df599a561a2fd33424b0d3f"
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
