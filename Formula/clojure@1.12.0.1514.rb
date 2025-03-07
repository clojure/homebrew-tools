class ClojureAT11201514 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1514/clojure-tools-1.12.0.1514.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1514.tar.gz"
  sha256 "2ebfdeaddcd9a93a796b1803ce69b6ef4184009be84dda80103ed9b9aee2bc42"
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
