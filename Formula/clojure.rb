class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.4.1607/clojure-tools-1.12.4.1607.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.4.1607.tar.gz"
  sha256 "57024e5cdd288a3f13ec9c7be481dbc502e4cf329ed93fe34d8729d6271975c9"
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
