class ClojureAT11221565 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.2.1565/clojure-tools-1.12.2.1565.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.2.1565.tar.gz"
  sha256 "aa3d11aa020bfa981ba9d3271bebc27c78ab6b305503cae8db308a3a50f36179"
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
