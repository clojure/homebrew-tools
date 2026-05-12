class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.5.1638/clojure-tools-1.12.5.1638.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.5.1638.tar.gz"
  sha256 "7807e1034441cae43c21d8a026c1d8a2d20f63f90398b8034470b0e2e1f31791"
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
