class ClojureAT11241612 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.4.1612/clojure-tools-1.12.4.1612.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.4.1612.tar.gz"
  sha256 "584c7256bccb0db69f91d5eea0a78c7ec22bdf34e28ed7aeeaab1c60eb9ac85f"
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
